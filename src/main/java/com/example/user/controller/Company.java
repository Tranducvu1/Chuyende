package com.example.user.controller;

import javax.persistence.*;

import lombok.Data;

@Entity
@Data
@Table(name = "eip_m_company")
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "company_id")
    private int companyId;

    @Column(name = "company_name", length = 64, nullable = false)
    private String companyName;

    @Column(name = "company_name_kana", length = 64)
    private String companyNameKana;

    @Column(name = "zipcode", length = 8)
    private String zipcode;

    @Column(name = "address", length = 64)
    private String address;

    @Column(name = "telephone", length = 15)
    private String telephone;

    @Column(name = "fax_number", length = 15)
    private String faxNumber;

    @Column(name = "url", length = 99)
    private String url;

    @Column(name = "ipaddress", length = 99)
    private String ipAddress;

    @Column(name = "port")
    private Integer port;

    @Column(name = "ipaddress_internal", length = 99)
    private String ipAddressInternal;

    @Column(name = "port_internal")
    private Integer portInternal;

    @Column(name = "create_date")
    private java.sql.Date createDate;

    @Column(name = "update_date")
    private java.sql.Timestamp updateDate;

    
}
