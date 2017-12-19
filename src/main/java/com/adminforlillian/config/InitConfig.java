package com.adminforlillian.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource("classpath:config.properties")
public class InitConfig {

//    //auth 기본 url
//    @Value("${config.url.oauth.internal.api}")
//    private String UrlAuthInternalApi;
//
//    //쿠키 도메인
//    @Value("${config.cookie.domain}")
//    private String CookieDomain;
//
//    //파트너센터 url
//    @Value("${config.url.partner}")
//    private String UrlPartner;
//
//    //cafe api url
//    @Value("${config.url.cafe.api}")
//    private String UrlCafeApi;
//
//    //fipe api url
//    @Value("${config.fipe.api.url}")
//    private String FipeApiUrl;
//
//    //fipe api ver
//    @Value("${config.fipe.api.ver}")
//    private String FipeApiVer;
//
//    //cafe api front
//    @Value("${config.url.external.cafe}")
//    private String cafeApi;
//
//    //onstove url
//    @Value("${config.url.front}")
//    private String UrlFront;
//
//    //game api url
//    @Value("${config.internal.game.url}")
//    private String gameApi;
//
//    //mobile game api url
//    @Value("${config.url.mobile.game}")
//    private String mobileApi;
//
//
//
//    public String getUrlAuthInternalApi() {
//        return UrlAuthInternalApi;
//    }
//
//    public String getCookieDomain() {
//        return CookieDomain;
//    }
//
//    public String getUrlPartner() {
//        return UrlPartner;
//    }
//
//    public String getUrlCafeApi() {
//        return UrlCafeApi;
//    }
//
//    public String getFipeApiUrl() {
//        return FipeApiUrl;
//    }
//
//    public String getFipeApiVer() {
//        return FipeApiVer;
//    }
//
//    public String getCafeApi() { return cafeApi; }
//
//    public String getUrlFront() { return UrlFront; }
//
//    public String getGameApi(){return gameApi;}
//
//    public String getMobileApi(){return mobileApi;}
}
