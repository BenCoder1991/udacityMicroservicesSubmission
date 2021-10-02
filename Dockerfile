FROM python:3.7.3-stretch

## Step 1:
# REFERENCE: re-using snippet from previous exercise, since directly applicable
WORKDIR /app

## Step 2:
# Copy source code to working directory
# REFERENCE: re-using snippet from previous exercise, since directly applicable
COPY . app.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
# hadolint ignore=DL3042
# REFERENCE: re-using snippet from previous exercise, since directly applicable
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
EXPOSE 80

## Step 5:
# Run app.py at container launch
# REFERENCE: re-using snippet from previous exercise, since directly applicable
CMD ["python", "app.py"]

