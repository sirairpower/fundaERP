alter table FE_PART_PROCESSES_STANDARD add constraint FK_FE_PART_PROCESSES_STANDARD_PROCESS_TYPE foreign key (PROCESS_TYPE_ID) references FE_MACHINE_PROCESSES(ID);
create index IDX_FE_PART_PROCESSES_STANDARD_PROCESS_TYPE on FE_PART_PROCESSES_STANDARD (PROCESS_TYPE_ID);
