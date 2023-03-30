#/bin/bash

# clone repository
git clone https://github.com/shirowanisan/voicevox_engine.git
cd voicevox_engine
git switch c-1.6.0+v-0.12.3+gpu

# language setting
asdf plugin-add python
asdf install python 3.8.10
asdf local python 3.8.10

# パッケージインストール
python3 -m venv venv
source ./venv/bin/activate
pip install typing-extensions==4.5.0
pip install -r requirements.txt
pip install espnet resampy typeguard==2.13.3

# speaker_infoディレクトリを作成
mkdir speaker_info

# ダウンロードするファイルのURLリスト
urls=(
  "https://www.dropbox.com/s/lvxit2svbi1dvdf/3c37646f-3881-5374-2a83-149267990abc.zip?dl=1"
  "https://www.dropbox.com/s/aqhluxxx3jds4pf/292ea286-3d5f-f1cc-157c-66462a6a9d08.zip?dl=1"
  "https://www.dropbox.com/s/ffya01xzj175kcn/2932eb06-e388-45bf-a6ba-dbc66a48961e.zip?dl=1"
  "https://www.dropbox.com/s/6fu8s9vz4rc5twq/a60ebf6c-626a-7ce6-5d69-c92bf2a1a1d0.zip?dl=1"
  "https://www.dropbox.com/s/lksqn9hvdti62ab/a6367fd2-7d4e-46cb-af80-47cf2529a968.zip?dl=1"
  "https://www.dropbox.com/s/0n975cas7aftoy7/b28bb401-bc43-c9c7-77e4-77a2bbb4b283.zip?dl=1"
  "https://www.dropbox.com/s/6vbrt3mgaygpkah/c97966b1-d80c-04f5-aba5-d30a92843b59.zip?dl=1"
  "https://www.dropbox.com/s/wnnt1zywmsacv7e/cb11bdbd-78fc-4f16-b528-a400bae1782d.zip?dl=1"
  "https://www.dropbox.com/s/ywhtiohe8foeu6d/d1143ac1-c486-4273-92ef-a30938d01b91.zip?dl=1"
  "https://www.dropbox.com/s/jf6ih937gh43kpx/d219f5ab-a50b-4d99-a26a-a9fc213e9100.zip?dl=1"
  "https://www.dropbox.com/s/s54of5b7pvqsfid/d312d0fb-d38d-434e-825d-cbcbfd105ad0.zip?dl=1"
)

# speaker_infoディレクトリに解凍
for url in "${urls[@]}"; do
  wget -P speaker_info $url
  unzip -o -d speaker_info speaker_info/$(basename $url)
done
