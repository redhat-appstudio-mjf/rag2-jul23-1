FROM registry.access.redhat.com/ubi9/python-311:1-66.1720018730
### Update sqlite for chroma
USER root
RUN dnf remove sqlite3 -y
RUN dnf install diffutils -y
RUN  wget https://www.sqlite.org/2023/sqlite-autoconf-3410200.tar.gz
RUN tar -xvzf sqlite-autoconf-3410200.tar.gz
WORKDIR sqlite-autoconf-3410200
RUN ./configure
RUN make
RUN make install
RUN mv /usr/local/bin/sqlite3 /usr/bin/sqlite3
ENV LD_LIBRARY_PATH="/usr/local/lib"
####
WORKDIR /rag
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r /rag/requirements.txt
COPY rag_app.py .
COPY manage_vectordb.py .
EXPOSE  8501
ENV  HF_HUB_CACHE=/rag/models/
ENTRYPOINT [ "streamlit", "run" ,"rag_app.py" ]