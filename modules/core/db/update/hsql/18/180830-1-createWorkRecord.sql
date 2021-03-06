create table FE_WORK_RECORD (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    WORK_ORDER_ID varchar(36) not null,
    OPERATE_TYPE integer,
    RECORD_NO bigint not null,
    EMPLOYEE_ID varchar(36),
    WORK_HOUR_TYPE integer,
    START_TIME timestamp not null,
    END_TIME timestamp,
    TIME_USED integer,
    STATUS integer not null,
    UNIT integer,
    UNIT_WEIGHT decimal(19, 2),
    FINISHED_QUANTITY decimal(19, 2),
    SETUP_LOSS_QUANTITY decimal(19, 2),
    NG_LOSS_QUANTITY decimal(19, 2),
    MATERIAL_LOSS_QUANTITY decimal(19, 2),
    SETUP_LOSS_UNIT integer,
    NG_LOSS_UNIT integer,
    MATERIAL_LOSS_UNIT integer,
    REMARK longvarchar,
    --
    primary key (ID)
);
