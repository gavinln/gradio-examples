import gradio as gr

demo = gr.Interface(lambda: "hello", None, "textbox")

demo.launch()
