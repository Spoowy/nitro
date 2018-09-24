-module(action_confirm).
-author('Rusty Klophaus').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_action(#confirm{target=Control,text=Text,postback=Postback,delegate=Delegate}) ->
    try
        begin
            PostbackScript = wf_event:new(Postback, Control, Delegate, event, "[]", []),
            ["if (confirm(\"",nitro:js_escape(Text),"\")) {",PostbackScript,"}"]
        end
    catch M:R:S -> io:format("~p,~p:~p", [M,R,S]) end.
