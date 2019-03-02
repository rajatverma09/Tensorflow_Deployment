# Tensorflow Serving Deployment (Using REST API calls)

This repo contains submission of Lab-5 and Lab-6

## Client Side:
### Client needs to run predict_cl.py file available in /data folder inside Lab-5 and Lab-6
## Lab-5
### Syntax:  ``` python3 predict_cl.py <dataset> ``` 
### To run server: ``` tensorflow_model_server   --port=8500   --rest_api_port=8501   --model_name="iris"   --model_base_path="($PWD)/model_for_serving/iris/" ```

### Syntax:  ``` python3 predict_cl.py <dataset> <IP-of-server>```
### To run server: ``` . deploy.sh ```
