echo "Enter IP of the server:"
read IP

echo "Enter username of the server machine"
read u_name
echo "Enter password of the server machine"
read u_pass

sshpass -p "$u_pass"   ssh -t $u_name@$IP "mkdir -p ~/tensorflow_server_iris && rm -rf ./tensorflow_server_iris/*"
echo "Folder created on deployment server"
#sshpass -p "$u_pass"   ssh -t $u_name@$IP "echo $u_pass | sudo -S  apt-get install unzip"
sshpass -p "$u_pass" scp iris.zip $u_name@$IP:~/tensorflow_server_iris/iris_ias.zip
echo "File successfully sent to deployment server"

#Install tensorflow server on the server machine using bash commands
#sshpass -p "$u_pass"   ssh -t $u_name@$IP "echo \"deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal\" | echo $u_pass | sudo -S tee /etc/apt/sources.list.d/tensorflow-serving.list &&  curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | sudo  apt-key --assume-yes  add -"
#sshpass -p "$u_pass" ssh -t $u_name@$IP "echo $u_pass | sudo -S apt-get --assume-yes update && sudo apt-get --assume-yes  install tensorflow-model-server && echo \"DONE HERE!!!!!!!\"" 
#sshpass -p "$u_pass" ssh -t $u_name@$IP "echo $u_pass | sudo -S apt-get --assume-yes upgrade tensorflow-model-server && echo \"DONE HERE ALSOOOOOO!!!!\""

#sshpass -p "$u_pass" ssh -t $u_name@$IP "cd ~/tensorflow_server_iris && unzip iris_ias.zip"
echo "File unzipped"

echo"Running tensorflow server"
sshpass -p "$u_pass" ssh -t $u_name@$IP "tensorflow_model_server   --port=8500   --rest_api_port=8501   --model_name=\"iris\"   --model_base_path=\"/home/$u_name/tensorflow_server_iris/model_for_serving/iris/\""


