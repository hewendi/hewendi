package com.woucloud.admin.mapper;

import com.woucloud.admin.domain.adminUser;
import com.woucloud.admin.domain.adminUserWithBLOBs;

public interface adminUserMapper {
    int deleteByPrimaryKey(Short userId);

    int insert(adminUserWithBLOBs record);

    int insertSelective(adminUserWithBLOBs record);

    adminUserWithBLOBs selectByPrimaryKey(Short userId);

    int updateByPrimaryKeySelective(adminUserWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(adminUserWithBLOBs record);

    int updateByPrimaryKey(adminUser record);
}