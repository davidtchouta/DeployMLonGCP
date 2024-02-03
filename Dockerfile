FROM python:3.9

#RUN pip install virtualenv
#ENV VIRTUAL_ENV=/venv
#RUN virtualenv venv -p python3
#ENV PATH="VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
#ADD . /app

# Copier les fichiers requis dans le conteneur
COPY requirements.txt requirements.txt
COPY app.py app.py
COPY PowerBi_pycaret.pkl PowerBi_pycaret.pkl
COPY templates/home.html /app/templates/home.html
COPY static/style.css /app/static/style.css

# Install dependencies
#RUN pip install - r requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 
#ENV PORT 8080
EXPOSE 8080

ENV FLASK_APP=app.py

# Run the application:
#CMD ["gunicorn", "app:app", "--config=config.py"]
ENTRYPOINT [ "flask"]
CMD [ "run", "--host", "0.0.0.0" ]
