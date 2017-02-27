package com.anyofficeanywhere.admin.mapper;

import com.anyofficeanywhere.admin.domain.adminUser;
import com.anyofficeanywhere.admin.domain.adminUserWithBLOBs;

public interface adminUserMapper {
    int deleteByPrimaryKey(Short userId);

    int insert(adminUserWithBLOBs record);

    int insertSelective(adminUserWithBLOBs record);

    adminUserWithBLOBs selectByPrimaryKey(Short userId);

    int updateByPrimaryKeySelective(adminUserWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(adminUserWithBLOBs record);

    int updateByPrimaryKey(adminUser record);
}