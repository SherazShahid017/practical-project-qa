from application import app


if __name__ == '__main__':
    app.debug = true
    app.run(port=5001, host='0.0.0.0')
