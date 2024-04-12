import gradio as gr


def echo(text, request: gr.Request):
    ip_address = "cannot get ip address"
    if request:
        print("Request headers dictionary:", request.headers)
        if request.client.host:
            ip_address = str(request.client.host)
        print("IP address:", ip_address)
        print("Query parameters:", dict(request.query_params))

    return text + " " + ip_address


io = gr.Interface(echo, "textbox", "textbox").launch()
