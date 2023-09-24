package com.example.user.models;

import javax.persistence.*;

import lombok.Data;

import java.sql.Date;

@Entity
@Data
@Table(name = "eip_m_company")
public class EipMCompany {

    @Id
    @Column(name = "company_id")
    private Integer companyId;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "company_name_kana")
    private String companyNameKana;

    @Column(name = "zipcode")
    private String zipcode;

    @Column(name = "address")
    private String address;

    @Column(name = "telephone")
    private String telephone;

    @Column(name = "fax_number")
    private String faxNumber;

    @Column(name = "url")
    private String url;

    @Column(name = "ipaddress")
    private String ipAddress;

    @Column(name = "port")
    private int port;

    @Column(name = "ipaddress_internal")
    private String ipAddressInternal;

    @Column(name = "port_internal")
    private int portInternal;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "update_date")
    private Date updateDate;

   
}
