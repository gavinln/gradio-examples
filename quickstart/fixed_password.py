import gradio as gr


def hello(name):
    return "Hello, " + name


io = gr.Interface(hello, "textbox", "textbox")
io.launch(auth=("admin", "pass1234"))
