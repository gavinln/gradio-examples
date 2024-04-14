import gradio as gr


def greet(name):
    return "Hello " + name + "!"


with gr.Blocks() as demo:
    name = gr.Textbox(label="Name")
    output = gr.Textbox(label="Output Box")
    greet_btn = gr.Button("Greet")
    # greet_btn.click(fn=greet, inputs=name, outputs=output, api_name="greet")


demo.launch()

# alternatively can use Python decorators
# @greet_btn.click(inputs=name, outputs=output)
# for the greet function
