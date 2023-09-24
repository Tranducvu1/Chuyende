package com.example.user.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Column;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.Data;

import java.util.Date;

@Data
@Entity
@Table(name = "eip_m_post")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class EipMPost {

    @Id
    @Column(name = "post_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer postId;

    
    @Column(name = "company_id")
    private Integer companyId;


    @Column(name = "post_name", length = 64, nullable = false)
    private String postName;

    @Column(name = "zipcode", length = 8)
    private String zipcode;

    @Column(name = "address", length = 64)
    private String address;

    @Column(name = "in_telephone", length = 15)
    private String inTelephone;

    @Column(name = "out_telephone", length = 15)
    private String outTelephone;

    @Column(name = "fax_number", length = 15)
    private String faxNumber;

    @Column(name = "group_name", length = 99, unique = true)
    private String groupName;

    @Column(name = "sort")
    private Integer sort;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "update_date")
    private Date updateDate;

   

}

