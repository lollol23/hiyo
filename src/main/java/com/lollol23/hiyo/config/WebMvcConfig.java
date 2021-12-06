package com.lollol23.hiyo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.lollol23.hiyo.common.FileManagerService;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 서버(내 컴퓨터) 의 특정 위치의 파일들을 
		// 내가 정한 url path로 접근하게 하는 설정
		registry.addResourceHandler("/images/**")  // /images/3_3295124124/test.png
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
	}
}
