package org.harvan.maven.mavendemo.controller;

import static reactor.core.scheduler.Schedulers.elastic;

import java.util.Objects;
import org.harvan.maven.mavendemo.entity.HelloRequest;
import org.harvan.maven.mavendemo.entity.HelloResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/hello")
public class HelloController {

  @RequestMapping("/welcome")
  public Mono<HelloResponse> hello(HelloRequest request) {
    return Mono.defer(() -> {
      HelloResponse response = WebMapper.MAPPER.mapFromRequest(request);
      response.setMessage("Welcome");

      if (Objects.isNull(response.getName())) {
        response.setName("Unknown");
      }

      return Mono.just(response);
    }).subscribeOn(elastic());
  }
}