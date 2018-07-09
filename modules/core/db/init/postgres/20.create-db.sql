-- begin FE_COMPANY
create unique index IDX_FE_COMPANY_UK_NO_ on FE_COMPANY (NO_) where DELETE_TS is null ^
-- end FE_COMPANY
-- begin FE_DEPARTMENT
alter table FE_DEPARTMENT add constraint FK_FE_DEPARTMENT_MANAGED_BY foreign key (MANAGED_BY_ID) references FE_EMPLOYEE(ID)^
create unique index IDX_FE_DEPARTMENT_UK_NO_ on FE_DEPARTMENT (NO_) where DELETE_TS is null ^
-- end FE_DEPARTMENT
-- begin FE_EMPLOYEE
alter table FE_EMPLOYEE add constraint FK_FE_EMPLOYEE_DEPARTMENT foreign key (DEPARTMENT_ID) references FE_DEPARTMENT(ID)^
create unique index IDX_FE_EMPLOYEE_UK_NO_ on FE_EMPLOYEE (NO_) where DELETE_TS is null ^
create index IDX_FE_EMPLOYEE_DEPARTMENT on FE_EMPLOYEE (DEPARTMENT_ID)^
-- end FE_EMPLOYEE
-- begin FE_INVENTORY_ITEM
create unique index IDX_FE_INVENTORY_ITEM_UK_NO_ on FE_INVENTORY_ITEM (NO_) where DELETE_TS is null ^
-- end FE_INVENTORY_ITEM
-- begin FE_MACHINE
alter table FE_MACHINE add constraint FK_FE_MACHINE_DEPARTMENT foreign key (DEPARTMENT_ID) references FE_DEPARTMENT(ID)^
create unique index IDX_FE_MACHINE_UK_NO_ on FE_MACHINE (NO_) where DELETE_TS is null ^
create index IDX_FE_MACHINE_DEPARTMENT on FE_MACHINE (DEPARTMENT_ID)^
-- end FE_MACHINE
-- begin FE_WORK_ORDER
alter table FE_WORK_ORDER add constraint FK_FE_WORK_ORDER_INVENTORY_ITEM foreign key (INVENTORY_ITEM_ID) references FE_INVENTORY_ITEM(ID)^
alter table FE_WORK_ORDER add constraint FK_FE_WORK_ORDER_DEFAULT_MACHINE foreign key (DEFAULT_MACHINE_ID) references FE_MACHINE(ID)^
alter table FE_WORK_ORDER add constraint FK_FE_WORK_ORDER_BACKUP_MACHINES foreign key (BACKUP_MACHINES_ID) references FE_MACHINE(ID)^
create unique index IDX_FE_WORK_ORDER_UK_NO_ on FE_WORK_ORDER (NO_) where DELETE_TS is null ^
create index IDX_FE_WORK_ORDER_INVENTORY_ITEM on FE_WORK_ORDER (INVENTORY_ITEM_ID)^
create index IDX_FE_WORK_ORDER_DEFAULT_MACHINE on FE_WORK_ORDER (DEFAULT_MACHINE_ID)^
create index IDX_FE_WORK_ORDER_BACKUP_MACHINES on FE_WORK_ORDER (BACKUP_MACHINES_ID)^
-- end FE_WORK_ORDER
-- begin FE_WORK_RECORD
alter table FE_WORK_RECORD add constraint FK_FE_WORK_RECORD_WORK_ORDER foreign key (WORK_ORDER_ID) references FE_WORK_ORDER(ID)^
alter table FE_WORK_RECORD add constraint FK_FE_WORK_RECORD_EMPLOYEE foreign key (EMPLOYEE_ID) references FE_EMPLOYEE(ID)^
create index IDX_FE_WORK_RECORD_WORK_ORDER on FE_WORK_RECORD (WORK_ORDER_ID)^
create index IDX_FE_WORK_RECORD_EMPLOYEE on FE_WORK_RECORD (EMPLOYEE_ID)^
-- end FE_WORK_RECORD
-- begin FE_MACHINE_PROCESSES
alter table FE_MACHINE_PROCESSES add constraint FK_FE_MACHINE_PROCESSES_MACHINE foreign key (MACHINE_ID) references FE_MACHINE(ID)^
create unique index IDX_FE_MACHINE_PROCESSES_UNQ on FE_MACHINE_PROCESSES (MACHINE_ID, PROCESS_TYPE) where DELETE_TS is null ^
create index IDX_FE_MACHINE_PROCESSES_MACHINE on FE_MACHINE_PROCESSES (MACHINE_ID)^
-- end FE_MACHINE_PROCESSES
-- begin FE_PART_PROCESSES_STANDARD
alter table FE_PART_PROCESSES_STANDARD add constraint FK_FE_PART_PROCESSES_STANDARD_PART_NO foreign key (PART_NO_ID) references FE_INVENTORY_ITEM(ID)^
alter table FE_PART_PROCESSES_STANDARD add constraint FK_FE_PART_PROCESSES_STANDARD_PROCESS_TYPE foreign key (PROCESS_TYPE_ID) references FE_MACHINE_PROCESSES(ID)^
create unique index IDX_FE_PART_PROCESSES_STANDARD_UNQ on FE_PART_PROCESSES_STANDARD (PART_NO_ID, PROCESS_TYPE_ID, FROM_) where DELETE_TS is null ^
create index IDX_FE_PART_PROCESSES_STANDARD_PART_NO on FE_PART_PROCESSES_STANDARD (PART_NO_ID)^
create index IDX_FE_PART_PROCESSES_STANDARD_PROCESS_TYPE on FE_PART_PROCESSES_STANDARD (PROCESS_TYPE_ID)^
-- end FE_PART_PROCESSES_STANDARD
