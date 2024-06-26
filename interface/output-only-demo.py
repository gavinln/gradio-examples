import time

import gradio as gr


def fake_gan():
    time.sleep(1)
    base = "https://images.unsplash.com"
    images = [
        base
        + "/photo-1507003211169-0a1dd7228f2d"
        + "?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8"
        + "&auto=format&fit=crop&w=387&q=80",
        base
        + "/photo-1554151228-14d9def656e4"
        + "?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8"
        + "&auto=format&fit=crop&w=386&q=80",
        base
        + "/photo-1542909168-82c3e7fdca5c"
        + "?ixlib=rb-1.2.1"
        + "&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aH"
        + "VtYW4lMjBmYWNlfGVufDB8fDB8fA%3D%3D"
        + "&w=1000&q=80",
    ]
    return images


demo = gr.Interface(
    fn=fake_gan,
    inputs=None,
    outputs=gr.Gallery(label="Generated Images", columns=[1]),
    title="FD-GAN",
    description=(
        "This is a fake demo of a GAN. In reality, "
        "the images are randomly chosen from Unsplash."
    ),
)

demo.launch()
