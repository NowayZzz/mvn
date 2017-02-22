package com.base.util.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 备注
 * @author Noway
 *
 */
@Documented
@Target(ElementType.TYPE)
@Retention(value = RetentionPolicy.RUNTIME)
public @interface Remark {
	String value() default "";
}
