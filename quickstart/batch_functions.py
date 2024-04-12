import gradio as gr


def trim_words(words, lens):
    trimmed_words = []
    for word, length in zip(words, lens):
        end = min(int(length), len(word))
        trimmed_words.append(word[:end])
    return [trimmed_words]


demo = gr.Interface(
    fn=trim_words,
    inputs=["textbox", "number"],
    outputs=[gr.Textbox()],
    batch=True,
    max_batch_size=16,
)

demo.launch()
