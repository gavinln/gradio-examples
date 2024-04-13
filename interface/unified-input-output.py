import gradio as gr


def generate_info(text_prompt):
    word_len = len(text_prompt)
    return 'The word "{}" has {} characters'.format(text_prompt, word_len)


textbox = gr.Textbox(label="Word")

demo = gr.Interface(generate_info, textbox, textbox)

demo.launch()
