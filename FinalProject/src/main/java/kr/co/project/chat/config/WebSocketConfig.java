package kr.co.project.chat.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import kr.co.project.chat.handler.EchoHandler;

@Controller
@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// 핸들러 bean, 경로 저장, setAllowed는 모든 출처에서 접근을 허용하여 클라이언트-서버간의 실시간 통신 가능하게
		registry.addHandler(echoHandler(), "/echo/{cr_no}").setAllowedOrigins("*");
	}

	
	@Bean // 내가 만든 핸들러 bean으로 저장
	public WebSocketHandler echoHandler() {
		return new EchoHandler();
	}

}
