# erlang-introduction
A slide deck used for a talk introducing Erlang


Suggested script for talk:

```erlang
1> c(echo).                 
{ok,echo}
2> EchoPid = echo:start().
<0.79.0>
3> EchoPid ! hello.
<0.79.0> received hello
hello
```

Add new feature:

 - message counter
 - "forget" to add to the `io:format` though

Show old state still running and then effects of update:
  
```erlang
4> c(echo).                 
{ok,echo}
5> EchoPid ! hello.
<0.79.0> received hello
hello
6> EchoPid ! reload.
reload
7> EchoPid ! hello.
<0.79.0> received hello
hello  
```
 
Fix introduced bug, then compile, reload and show current state has been maintained:

 - add the Counter to the `io:format`
  
```erlang
8> c(echo).                 
{ok,echo}
9> EchoPid ! reload.
reload
10> EchoPid ! hello.
<0.79.0> counter 3 received hello
hello
```

Possible next actions:

 -  we've leaked the API introduce API methods for: 
 - reload
 - stop, graceful stop
 - refactor using gen_server
 - add supervision
 - add clustering
 - show tracing
 - add eunit test

