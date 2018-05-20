-record(employee, {emp_no, name, salary, sex, phone, room_no}).
-record(dept,     {id, name}).
-record(project,  {name, number}).
-record(manager,  {emp, dept}).
-record(at_dep,   {emp, dept_id}).
-record(in_proj,  {emp, proj_name}).



%% %%-record(dept,     {id, name}).
%% depts() ->
%%   [#dept{id='B/SF',  name="Open Telecom Platform"},
%%    #dept{id='B/SFP', name="OTP - Product Development"},
%%    #dept{id='B/SFR', name="Computer Science Laboratory"}
%%   ].
%%
%% %%-record(project,  {name, number}).
%% projects() ->
%%   [#project{name=erlang,        number=1},
%%    #project{name=otp,           number=2},
%%    #project{name=beam,          number=3},
%%    #project{name=mnesia,        number=5},
%%    #project{name=wolf,          number=6},
%%    #project{name=documentation, number=7},
%%    #project{name=www,           number=8}
%%   ].
%%
%% %%-record(manager,  {emp, dept}).
%% managers()->
%%   [#manager{emp=104465, dept='B/SF'},
%%    #manager{emp=104465, dept='B/SFP'},
%%    #manager{emp=114872, dept='B/SFR'}
%%   ].
%%
%% %%-record(at_dep,   {emp, dept_id}).
%% at_deps() ->
%%   [#at_dep{emp=104465, dept_id='B/SF'},
%%    #at_dep{emp=107912, dept_id='B/SF'},
%%    #at_dep{emp=114872, dept_id='B/SFR'},
%%    #at_dep{emp=104531, dept_id='B/SFR'},
%%    #at_dep{emp=104659, dept_id='B/SFR'},
%%    #at_dep{emp=104732, dept_id='B/SFR'},
%%    #at_dep{emp=117716, dept_id='B/SFP'},
%%    #at_dep{emp=115018, dept_id='B/SFP'}
%%   ].
%%
%% %%-record(in_proj,  {emp, proj_name}).
%% in_projs() ->
%%   [#in_proj{emp=104465, proj_name=otp},
%%    #in_proj{emp=107912, proj_name=otp},
%%    #in_proj{emp=114872, proj_name=otp},
%%    #in_proj{emp=104531, proj_name=otp},
%%    #in_proj{emp=104531, proj_name=mnesia},
%%    #in_proj{emp=104545, proj_name=wolf},
%%    #in_proj{emp=104659, proj_name=otp},
%%    #in_proj{emp=104659, proj_name=wolf},
%%    #in_proj{emp=104732, proj_name=otp},
%%    #in_proj{emp=104732, proj_name=mnesia},
%%    #in_proj{emp=104732, proj_name=erlang},
%%    #in_proj{emp=117716, proj_name=otp},
%%    #in_proj{emp=117716, proj_name=documentation},
%%    #in_proj{emp=115018, proj_name=otp},
%%    #in_proj{emp=115018, proj_name=mnesia}
%%   ].
