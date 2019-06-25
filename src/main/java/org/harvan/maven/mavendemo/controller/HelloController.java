package org.harvan.maven.mavendemo.controller;

import static reactor.core.scheduler.Schedulers.elastic;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/hello")
public class HelloController {

  @RequestMapping("/welcome")
  public Mono<String> hello() {
    return Mono.defer(() -> Mono.just("welcome")).subscribeOn(elastic());
  }
}