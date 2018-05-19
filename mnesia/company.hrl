-record(employee, {emp_no, name, salary, sex, phone, room_no}).
-record(dept,     {id, name}).
-record(project,  {name, number}).
-record(manager,  {emp, dept}).
-record(at_dep,   {emp, dept_id}).
-record(in_proj,  {emp, proj_name}).


init() ->
  mnesia:create_table(employee,
                      [{attributes, record_info(fields, employee)}]),
  mnesia:create_table(dept,
                      [{attributes, record_info(fields, dept)}]),
  mnesia:create_table(project,
                      [{attributes, record_info(fields, project)}]),
  mnesia:create_table(manager, [{type, bag},
                      {attributes, record_info(fields, manager)}]),
  mnesia:create_table(at_dep,
                      [{attributes, record_info(fields, at_dep)}]),
  mnesia:create_table(in_proj, [{type, bag},
                      {attributes, record_info(fields, in_proj)}]).
