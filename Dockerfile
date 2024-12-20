FROM emacski/tensorflow-serving:latest

COPY ./output/serving_model models/imdb-review-model

ENV MODEL_NAME=imdb-review-model 
ENV MODEL_BASE_PATH=/models

ENTRYPOINT ["tensorflow_model_server", "--port=8500", "--rest_api_port=8501", "--model_name=${MODEL_NAME}", "--model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME}"]