package com.kps.server.dao;

import com.kps.server.entity.CompanyInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: fei
 * Date: 13-12-29
 * Time: 上午11:24
 * To change this template use File | Settings | File Templates.
 */
public interface ICompanyInfoDAO {

    public List<CompanyInfo> queryAllCompany();
}
