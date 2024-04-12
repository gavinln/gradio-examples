import time

import gradio as gr


def slowly_reverse(word, progress=gr.Progress()):
    progress(0, desc="Starting")
    time.sleep(1)
    progress(0.05)
    new_string = ""
    for letter in progress.tqdm(word, desc="Reversing"):
        time.sleep(0.25)
        new_string = letter + new_string  # type: ignore
    return new_string


demo = gr.Interface(fn=slowly_reverse, inputs=gr.Text(), outputs=gr.Text())

demo.launch()
