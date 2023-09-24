package com.example.user.models;


import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Data
@Table(name = "turbine_user")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class TurbineUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private String id;

    @Column(name = "login_name", unique = true, length = 32)
    private String loginName;

    @Column(name = "password_value", length = 200)
    private String passwordValue;

    @Column(name = "first_name", length = 99)
    private String firstName;

    @Column(name = "last_name", length = 99)
    private String lastName;

    @Column(name = "email", length = 99)
    private String email;

    @Column(name = "confirm_value", length = 99)
    private String confirmValue;

    @Column(name = "modified")
    private Timestamp modified;

    @Column(name = "created")
    private Timestamp created;

    @Column(name = "last_login")
    private Timestamp lastLogin;

    @Column(name = "disabled", length = 1)
    private char disabled;

    @Lob
    @Column(name = "objectdata")
    private byte[] objectData;

    @Column(name = "password_changed")
    private Timestamp passwordChanged;

    @Column(name = "company_id")
    private Integer companyId;

    @Column(name = "position_id")
    private Integer positionId;

    @Column(name = "in_telephone", length = 15)
    private String inTelephone;

    @Column(name = "out_telephone", length = 15)
    private String outTelephone;

    @Column(name = "cellular_phone", length = 15)
    private String cellularPhone;

    @Column(name = "cellular_mail", length = 99)
    private String cellularMail;

    @Column(name = "cellular_uid", length = 99)
    private String cellularUid;

    @Column(name = "first_name_kana", length = 99)
    private String firstNameKana;

    @Column(name = "last_name_kana", length = 99)
    private String lastNameKana;

    @Lob
    @Column(name = "photo")
    private byte[] photo;

    @Column(name = "has_photo", length = 1)
    private char hasPhoto;

    @Column(name = "photo_modified")
    private Timestamp photoModified;

    @Lob
    @Column(name = "photo_smartphone")
    private byte[] photoSmartphone;

    @Column(name = "has_photo_smartphone", length = 1)
    private char hasPhotoSmartphone;

    @Column(name = "photo_modified_smartphone")
    private Timestamp photoModifiedSmartphone;

    @Column(name = "tutorial_forbid", length = 1)
    private char tutorialForbid;

    @Column(name = "migrate_version", nullable = false)
    private int migrateVersion;

    @Column(name = "created_user_id")
    private Integer createdUserId;

    @Column(name = "updated_user_id")
    private Integer updatedUserId;

    @Column(name = "isAdmin")
    private Boolean isAdmin;

    
    @ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)  
    @JoinColumn(name="post_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private EipMPost eipMPost;
    
    @ManyToOne
    @JoinColumn(name = "company_id", insertable = false, updatable = false)
    private EipMCompany company;
 
}
