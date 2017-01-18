<?php

class Seo_Catalog_Extension extends TB_CatalogExtension
{
    /**
     * @var ControllerCommonSeoUrl
     */
    protected $seoUrlController;

    /** @var  Seo_Catalog_DefaultModel */
    protected $defaultModel;

    /**
     * @var Seo_Catalog_GeneratorModel
     */
    protected $generatorModel;

    /**
     * @var array
     */
    protected $settings = array();

    public function configure()
    {
        if (!defined('TB_SEO_MOD')) {
            return;
        }

        if ($this->engine->getOcConfig('config_seo_url')) {
            $this->eventDispatcher->connect('core:beforeRouting', array($this, 'beforeRouting'));
            $this->eventDispatcher->connect('core:pluginsPreBootstrap', array($this, 'setLanguages'));
            $this->eventDispatcher->connect('oc:ControllerCommonSeoUrl/index', array($this, 'initOcSeoUrlController'));
            $this->eventDispatcher->connect('catalog.template.header', array($this, 'addHeaderMeta'));
        }

        $this->eventDispatcher->connect('product/product.page_title.filter',  array($this, 'filterProductHeadingTitle'));
        $this->eventDispatcher->connect('product/category.page_title.filter', array($this, 'filterCategoryHeadingTitle'));

        $this->defaultModel   = $this->getModel('default');
        $this->generatorModel = $this->getModel('generator');
    }

    public function filterProductHeadingTitle(sfEvent $event, array $data)
    {
        $settings = $this->defaultModel->getGeneralSettings();

        $data['heading_title'] = $this->generatorModel->buildH1Heading('product', $event['data']['product_id'], $settings['product']['h1_heading']);
    }

    public function filterCategoryHeadingTitle(sfEvent $event, array $data)
    {
        $settings = $this->defaultModel->getGeneralSettings();

        $data['heading_title'] = $this->generatorModel->buildH1Heading('category', $this->themeData->category_id, $settings['category']['h1_heading']);
    }


    public function addHeaderMeta(TB_ViewSlotEvent $event)
    {
        if (null === $this->seoUrlController) {
            return;
        }

        if (!$this->settings['hreflang_tag'] || (!$this->settings['multilingual_keywords'] && !$this->settings['language_prefix'])) {
            return;
        }

        $content = '';
        foreach ($this->themeData->languages as $language) {
            $content .= sprintf('<link rel="alternate" href="%s" hreflang="%s" />', $language['current_url'], $language['code']) . "\n";
        }

        $event->insertContentAfter($content);
    }

    public function beforeRouting(sfEvent $event)
    {
        $this->settings = array_merge($this->defaultModel->getSettings(), $this->defaultModel->getGeneralSettings());


        if ($this->engine->getOcConfig('config_seo_url') && $this->settings['language_prefix']) {
            $this->checkLanguageRequest();
        }

        $event['themeData']['seo_settings'] = $this->settings;
    }

    protected function checkLanguageRequest()
    {
        $request = $this->engine->getOcRequest();

        if (!empty($request->get['_route_'])) {
            list($language_code) = $parts = explode('/', $request->get['_route_']);

            if ($settings_code = array_search($language_code, $this->settings['language_prefix_codes'])) {
                $language_code = $settings_code;
            }

            $languages = $this->engine->getEnabledLanguages();

            if (!isset($languages[$language_code])) {
                $language_code = $this->engine->getDefaultCatalogLanguage('code');
            } else {
                array_shift($parts);
                $request->get['_route_'] = implode('/', $parts);
            }

            if (empty($request->get['_route_']) && empty($request->get['route'])) {
                $request->get['route'] = 'common/home';
                unset($request->get['_route_']);
            }

            $url_language_code = $this->getUrlLanguageCode();
            if (empty($url_language_code) && !$this->settings['default_language_prefix']) {
                $url_language_code = $this->engine->getDefaultCatalogLanguage('code');
            }

            if ($language_code != $url_language_code) {
                $this->changeCurrentLanguage($languages[$language_code], $request->server['HTTP_HOST']);
            }
        } else
        if ($request->server['REQUEST_METHOD'] != 'POST' && !$this->settings['default_language_prefix'] && (empty($request->get['route']) || $request->get['route'] == 'common/home')) {
            $request->get['route'] = 'common/home';
            if ($this->context->getCurrentLanguage('code') != $this->engine->getDefaultCatalogLanguage('code')) {
                $this->changeCurrentLanguage($this->engine->getDefaultCatalogLanguage(), $request->server['HTTP_HOST']);
            }
        }
    }

    protected function changeCurrentLanguage($language_data, $HTTP_HOST)
    {
        $this->engine->getThemeExtension()->removeTranslation('theme');

        $language_code = $language_data['code'];

        setcookie('language', $language_code, time() + 60 * 60 * 24 * 30, '/', $HTTP_HOST);
        $this->engine->getOcSession()->data['language'] = $language_code;
        $this->engine->getOcConfig()->set('config_language_id', $language_data['language_id']);
        $this->engine->getOcConfig()->set('config_language', $language_code);

        $this->context->setCurrentLanguage($language_data);

        foreach ($this->engine->getThemeExtension()->getPlugins() as $plugin) {
            $plugin->refreshLanguage();
        }

        $this->themeData->importVars($this->engine->getThemeExtension()->loadDefaultTranslation());

        foreach ($this->engine->getExtensions() as $extension) {
            $extension->loadDefaultTranslation();
        }

        $language = new Language($language_data['directory']);
        $language->load($language_data['filename']);
        $this->engine->getOcRegistry()->set('language', $language);
    }

    public function getUrlLanguageCode()
    {
        $settings = $this->defaultModel->getSettings();

        if (!$settings['language_prefix']) {
            return '';
        }

        $url_code = $this->context->getCurrentLanguage('code');

        if (!$settings['default_language_prefix'] && $url_code == $this->engine->getDefaultCatalogLanguage('code')) {
            $url_code = '';
        } else
        if (!empty($this->settings['language_prefix_codes'][$url_code])) {
            $url_code = $this->settings['language_prefix_codes'][$url_code];
        }


        return $url_code;
    }

    public function initOcSeoUrlController(sfEvent $event)
    {
        $this->seoUrlController = $event->getSubject();

        $this->seoUrlController->setUrlLanguageCode($this->getUrlLanguageCode());
        $this->seoUrlController->setUrlLanguageId($this->context->getCurrentLanguage('id'));

        $request = $this->engine->getOcRequest();

        if (!empty($request->get['_route_']) && $this->settings['pretty_urls'] && $this->engine->getOcConfig()->get('config_seo_url')) {
            $route_parts = explode('/', $request->get['_route_']);

            if(count($route_parts) >= 2) {
                $found = false;
                $file = str_replace(array('../', './'), '', $route_parts[0] . '/' . $route_parts[1]) . '.php';

                if (is_file($this->context->getAreaDir() . '/controller/' . $file)) {
                    $found = true;
                }

                if (!$found) {
                    foreach ($this->engine->getRoutesBag()->exportVars() as $extension => $routes) {
                        foreach ($routes as $route) {
                            if (0 === stripos($request->get['_route_'], $route['route'])) {
                                $found = true;

                                break;
                            }
                        }
                    }
                }

                if ($found) {
                    if ($this->engine->gteOc22()) {
                        ControllerStartupSeoUrl::$new_route = $request->get['_route_'];
                    } else {
                        ControllerCommonSeoUrl::$new_route = $request->get['_route_'];
                    }
                }
            }
        }

        if ($this->engine->gteOc22()) {
            ControllerStartupSeoUrl::$use_original_table = !$this->settings['multilingual_keywords'] || $this->settings['original_language']['code'] == $this->engine->getContext()->getCurrentLanguage('code');
            ControllerStartupSeoUrl::$use_original_table_fallback = true;
            ControllerStartupSeoUrl::$pretty_urls = !empty($this->settings['pretty_urls']);
        } else {
            ControllerCommonSeoUrl::$use_original_table = !$this->settings['multilingual_keywords'] || $this->settings['original_language']['code'] == $this->engine->getContext()->getCurrentLanguage('code');
            ControllerCommonSeoUrl::$use_original_table_fallback = true;
            ControllerCommonSeoUrl::$pretty_urls = !empty($this->settings['pretty_urls']);
        }
    }

    public function setLanguages()
    {
        if (null === $this->seoUrlController) {
            return;
        }

        $languages = $this->engine->getEnabledLanguages();

        if (!$this->settings['multilingual_keywords'] && !$this->settings['language_prefix']) {
            $this->themeData->languages = $languages;

            return;
        }

        $current_language = $this->engine->getContext()->getCurrentLanguage();

        $url = $this->engine->getOcUrl();
        $config = $this->engine->getOcConfig();

        $request_get = $this->engine->getOcRequest()->get;
        unset($request_get['route'], $request_get['_route_']);
        $get_query = http_build_query($request_get);

        if ($this->engine->gteOc22()) {
            $use_original_table = ControllerStartupSeoUrl::$use_original_table;
        } else {
            $use_original_table = ControllerCommonSeoUrl::$use_original_table;
        }

        $url_enable_cache = null;
        if (defined('TB_OPTIMIZATIONS_MOD') && property_exists('Url', 'enable_cache')) {
            $url_enable_cache = Url::$enable_cache;
            Url::$enable_cache = false;
        }

        foreach ($languages as &$language) {
            $config->set('config_language', $language['code']);
            $config->set('config_language_id', $languages[$language['code']]['id']);

            $this->context->setCurrentLanguage($languages[$language['code']]);
            $this->seoUrlController->setUrlLanguageCode($this->getUrlLanguageCode());
            $this->seoUrlController->setUrlLanguageId($languages[$language['code']]['id']);
            if (defined('TB_OPTIMIZATIONS_MOD') && property_exists('Url', 'current_language_id')) {
                Url::$current_language_id = $languages[$language['code']]['id'];
            }

            if ($this->engine->gteOc22()) {
                ControllerStartupSeoUrl::$use_original_table = !$this->settings['multilingual_keywords'] || $language['code'] == $this->settings['original_language']['code'];
            } else {
                ControllerCommonSeoUrl::$use_original_table = !$this->settings['multilingual_keywords'] || $language['code'] == $this->settings['original_language']['code'];
            }

            $language['current_url'] = $url->link($this->themeData->route, $get_query, TB_RequestHelper::isRequestHTTPS());
        }

        if (defined('TB_OPTIMIZATIONS_MOD') && property_exists('Url', 'enable_cache')) {
            Url::$enable_cache = $url_enable_cache;
        }

        $this->context->setCurrentLanguage($current_language);
        $this->seoUrlController->setUrlLanguageCode($this->getUrlLanguageCode());
        $this->seoUrlController->setUrlLanguageId($current_language['id']);

        if ($this->engine->gteOc22()) {
            ControllerStartupSeoUrl::$use_original_table = $use_original_table;
        } else {
            ControllerCommonSeoUrl::$use_original_table = $use_original_table;
        }

        if (defined('TB_OPTIMIZATIONS_MOD') && property_exists('Url', 'current_language_id')) {
            Url::$current_language_id = $current_language['language_id'];
        }

        $config->set('config_language', $current_language['code']);
        $config->set('config_language_id', $current_language['language_id']);

        $this->themeData->languages = $languages;
    }
}