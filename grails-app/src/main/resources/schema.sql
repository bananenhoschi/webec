alter table modul
    drop constraint fk_msp_note;

drop table note;

drop table modul;

drop table semester;



create table if not exists semester
(
	id bigint not null
		constraint semester_pkey
			primary key,
	version bigint not null,
	semester_typ varchar(255) not null,
	jahr integer not null
);

alter table semester owner to graded;

create table if not exists modul
(
	id bigint not null
		constraint modul_pkey
			primary key,
	version bigint not null,
	has_testat boolean not null,
	bezeichnung varchar(255),
	angerechnet boolean not null,
	dozent varchar(255),
	has_msp boolean not null,
	testat_passed boolean not null,
	msp_id bigint,
	credits integer not null,
	semester_id bigint not null
		constraint fk_semester
			references semester,
	kuerzel varchar(255) not null
);

alter table modul owner to graded;

create table if not exists note
(
	id bigint not null
		constraint note_pkey
			primary key,
	version bigint not null,
	gewichtung double precision,
	note double precision,
	modul_id bigint
		constraint fk_modul
			references modul
);

alter table note owner to graded;

alter table modul
	add constraint fk_msp_note
		foreign key (msp_id) references note;

