  ::  /app/moonrise
::::
::
/-  *moonrise
/+  dbug,
    default-agent,
    *moonrise,
    verb
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  %0
      values=(list @)
  ==
+$  card  card:agent:gall
--
%+  verb  &
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
=<
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
    eng      ~(. +> [bowl ~])
++  on-init
  ^-  [(list card) _this]
  ~&  >  "%moonrise initialized successfully."
  =^  cards  state
    abet:init:eng
  [cards this]
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  [(list card) _this]
  =^  cards  state
    abet:(load:eng old)
  [cards this]
++  on-poke
  |=  [=mark =vase]
  ^-  [(list card) _this]
  =^  cards  state
    abet:(poke:eng mark vase)
  [cards this]
::
++  on-peek
  |=  path=(pole knot)
  ^-  (unit (unit cage))
  (peek:eng path)
++  on-watch
  |=  path=(pole knot)
  ^-  [(list card) _this]
  =^  cards  state
    abet:(watch:eng path)
  [cards this]
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  =^  cards  state
    abet:(arvo:eng wire sign-arvo)
  [cards this]
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
--
::
::  Nested Core
::
|_  $:  =bowl:gall
        deck=(list card)
    ==
+*  that     .
    default  ~(. (default-agent that %|) bowl)
++  abet  ^-([(list card) _state] [(flop deck) state])
++  emit  |=(=card that(deck [card deck]))
++  emil  |=(lac=(list card) that(deck (welp (flop lac) deck)))
++  give  |=(=gift:agent:gall (emit %give gift))
::
++  connect-cards
  ^-  (list card)
  :~  [%pass /eyre/connect %arvo %e %connect [~ /apps/[dap.bowl]] dap.bowl]   
  ==
++  init
  ^+  that
  (emil connect-cards)
::
++  load
  |=  old=vase
  ^+  that
  ?>  ?=([%0 *] q.old)
  that(state !<(state-0 old))
::
++  poke
  |=  [=mark =vase]
  ^+  that
  ?+    mark  ~|(%invalid-poke that)
      %moonrise-action
    that
  ==
::
++  peek
  |=  path=(pole knot)
  ^-  (unit (unit cage))
  ?+    path  (on-peek:default path)
    [%x %values ~]       [~ ~ [%noun !>(values)]]
    [%x %value idx=@ ~]  [~ ~ [%noun !>((snag idx.path values))]]
  ==
::
++  watch
  |=  path=(pole knot)
  ^+  that
  ?+    path  (on-watch:default path)
      [%http-response *]
    that
    ::
      [%values ~]
    =^  cards  state
      :-  :~  [%give %fact ~ %sunrise-update !>(`update`[%risen values])]
          ==
      state
    (emil cards)
  ==
::
++  arvo
  |=  [wire=(pole knot) =sign-arvo]
  ^+  that
  ?+    sign-arvo  (on-arvo:default wire sign-arvo)
      [%eyre %bound *]
    ?:  accepted.sign-arvo
      %-  (slog leaf+"/apps/{(trip dap.bowl)} bound successfully!" ~)
      that
    %-  (slog leaf+"Binding /apps/{(trip dap.bowl)} failed!" ~)
    that
  ==
--
