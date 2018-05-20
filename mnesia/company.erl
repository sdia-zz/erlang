-module(company).
-export([init/0, populate/0, fill_records/0]).
-include("company.hrl").
-include_lib("stdlib/include/qlc.hrl").

init() ->
  mnesia:create_table(employee, [{attributes, record_info(fields, employee)}]),
  mnesia:create_table(dept,     [{attributes, record_info(fields, dept)}]),
  mnesia:create_table(project,  [{attributes, record_info(fields, project)}]),
  mnesia:create_table(manager,  [{type, bag}, {attributes, record_info(fields, manager)}]),
  mnesia:create_table(at_dep,   [{attributes, record_info(fields, at_dep)}]),
  mnesia:create_table(in_proj,  [{type, bag}, {attributes, record_info(fields, in_proj)}]).

insert_emp(Emp, DeptID, ProjNames) ->
  Ename = Emp#employee.name,
  io:format("~p~n", [Ename]),
  Fun = fun() ->
                mnesia:write(Emp),
                AtDep = #at_dep{emp = Ename, dept_id = DeptID},
                mnesia:write(AtDep),
                mk_projs(Ename, ProjNames)
        end,
  mnesia:transaction(Fun).

mk_projs(Ename, [ProjName | Tail]) ->
  mnesia:write(#in_proj{emp = Ename, proj_name = ProjName}),
  mk_projs(Ename, Tail);

mk_projs(_, []) -> ok.

populate() ->
  Emp = #employee{emp_no=14732,
                  name=klacke,
                  salary=7,
                  sex=male,
                  phone=98108,
                  room_no={221, 015}},
  insert_emp(Emp, 'B/SFR', [erlang, mnesia, otp]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIXTURES LOADING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fill_records([]) -> ok;
fill_records([H|T]) ->
  mnesia:write(H),
  fill_records(T).

fill_records() ->
  Fun = fun() ->
          fill_records(employees()),
          fill_records(depts()),
          fill_records(projects()),
          fill_records(managers()),
          fill_records(at_deps()),
          fill_records(in_projs())
  end,
  mnesia:transaction(Fun).


%%-record(employee, {emp_no, name, salary, sex, phone, room_no}).
employees() ->
  [#employee{emp_no=104465, name="Johnson Torbjorn",   salary=1, sex=male,  phone=99184, room_no={242,038}},
   #employee{emp_no=107912, name="Carlsson Tuula",     salary=2, sex=female,phone=94556, room_no={242,056}},
   #employee{emp_no=114872, name="Dacker Bjarne",      salary=3, sex=male,  phone=99415, room_no={221,035}},
   #employee{emp_no=104531, name="Nilsson Hans",       salary=3, sex=male,  phone=99495, room_no={222,026}},
   #employee{emp_no=104659, name="Tornkvist Torbjorn", salary=2, sex=male,  phone=99514, room_no={222,022}},
   #employee{emp_no=104732, name="Wikstrom Claes",     salary=2, sex=male,  phone=99586, room_no={221,015}},
   #employee{emp_no=117716, name="Fedoriw Anna",       salary=1, sex=female,phone=99143, room_no={221,031}},
   #employee{emp_no=115018, name="Mattsson Hakan",     salary=3, sex=male,  phone=99251, room_no={203,348}}
  ].

%%-record(dept,     {id, name}).
depts() ->
  [#dept{id='B/SF',  name="Open Telecom Platform"},
   #dept{id='B/SFP', name="OTP - Product Development"},
   #dept{id='B/SFR', name="Computer Science Laboratory"}
  ].

%%-record(project,  {name, number}).
projects() ->
  [#project{name=erlang,        number=1},
   #project{name=otp,           number=2},
   #project{name=beam,          number=3},
   #project{name=mnesia,        number=5},
   #project{name=wolf,          number=6},
   #project{name=documentation, number=7},
   #project{name=www,           number=8}
  ].

%%-record(manager,  {emp, dept}).
managers()->
  [#manager{emp=104465, dept='B/SF'},
   #manager{emp=104465, dept='B/SFP'},
   #manager{emp=114872, dept='B/SFR'}
  ].

%%-record(at_dep,   {emp, dept_id}).
at_deps() ->
  [#at_dep{emp=104465, dept_id='B/SF'},
   #at_dep{emp=107912, dept_id='B/SF'},
   #at_dep{emp=114872, dept_id='B/SFR'},
   #at_dep{emp=104531, dept_id='B/SFR'},
   #at_dep{emp=104659, dept_id='B/SFR'},
   #at_dep{emp=104732, dept_id='B/SFR'},
   #at_dep{emp=117716, dept_id='B/SFP'},
   #at_dep{emp=115018, dept_id='B/SFP'}
  ].

%%-record(in_proj,  {emp, proj_name}).
in_projs() ->
  [#in_proj{emp=104465, proj_name=otp},
   #in_proj{emp=107912, proj_name=otp},
   #in_proj{emp=114872, proj_name=otp},
   #in_proj{emp=104531, proj_name=otp},
   #in_proj{emp=104531, proj_name=mnesia},
   #in_proj{emp=104545, proj_name=wolf},
   #in_proj{emp=104659, proj_name=otp},
   #in_proj{emp=104659, proj_name=wolf},
   #in_proj{emp=104732, proj_name=otp},
   #in_proj{emp=104732, proj_name=mnesia},
   #in_proj{emp=104732, proj_name=erlang},
   #in_proj{emp=117716, proj_name=otp},
   #in_proj{emp=117716, proj_name=documentation},
   #in_proj{emp=115018, proj_name=otp},
   #in_proj{emp=115018, proj_name=mnesia}
  ].
