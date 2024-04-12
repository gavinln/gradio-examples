import gradio as gr


def alert_modal(name):
    gr.Info("starting process...")
    if name is None:
        gr.Warning("Name is empty")

    success = False
    if success is False:
        raise gr.Error("Process failed")


demo = gr.Interface(fn=alert_modal, inputs=gr.Text(), outputs=gr.Textbox())

demo.launch()
