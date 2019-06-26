package org.harvan.maven.mavendemo.controller;

import org.harvan.maven.mavendemo.entity.HelloRequest;
import org.harvan.maven.mavendemo.entity.HelloResponse;
import org.mapstruct.Mapper;

@Mapper
public interface WebBeanMapper {

  HelloResponse mapFromRequest(HelloRequest helloRequest);
}