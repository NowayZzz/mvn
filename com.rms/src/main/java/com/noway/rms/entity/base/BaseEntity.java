package com.noway.rms.entity.base;

import java.io.Serializable;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

public class BaseEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@TableId(type=IdType.UUID)
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public final String toString(){
        StringBuffer results = new StringBuffer();
        Class<? extends BaseEntity> clazz = getClass();
        results.append(getClass().getName() + "\n");
        Field fields[] = clazz.getDeclaredFields();
        try{
            AccessibleObject.setAccessible(fields, true);
            for(int i = 0; i < fields.length; i++)
                results.append("\t" + fields[i].getName() + "=" + fields[i].get(this) + "\n");
        }
        catch(Exception exception) { }
        return results.toString();
    }
	
}
