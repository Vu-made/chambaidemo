from flask import Flask, render_template, request, redirect, url_for, flash
from werkzeug.utils import secure_filename
import os
import subprocess
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'uploads'
app.config['TEST_FOLDER'] = 'test'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///grades.db'
app.secret_key = 'supersecretkey'

db = SQLAlchemy(app)

class Submission(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    filename = db.Column(db.String(150), nullable=False)
    score = db.Column(db.Integer, nullable=False)
    assignment = db.Column(db.String(50), nullable=False)

with app.app_context():
    db.create_all()

@app.route('/')
def index():
    submissions = Submission.query.all()
    return render_template('index.html', submissions=submissions)

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        flash('Không có phần tệp', 'error')
        return redirect(request.url)
    file = request.files['file']
    if file.filename == '':
        flash('Không có tệp nào được chọn', 'error')
        return redirect(request.url)
    assignment = request.form.get('assignment')
    if not assignment:
        flash('Không có bài tập nào được chỉ định', 'error')
        return redirect(request.url)
    if file:
        filename = secure_filename(file.filename)
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)
        result, score = run_tests(file_path, assignment)
        new_submission = Submission(filename=filename, score=score, assignment=assignment)
        db.session.add(new_submission)
        db.session.commit()
        flash(result, 'success' if score == 100 else 'error')
        return redirect(url_for('index'))

@app.route('/upload_test', methods=['POST'])
def upload_test():
    if 'test_folder' not in request.files:
        flash('Không có phần thư mục', 'error')
        return redirect(request.url)
    assignment_name = request.form.get('assignment_name')
    if not assignment_name:
        flash('Tên bài tập không được chỉ định', 'error')
        return redirect(request.url)
    test_folder = request.files.getlist('test_folder')
    for file in test_folder:
        filename = secure_filename(file.filename)
        file_path = os.path.join(app.config['TEST_FOLDER'], assignment_name, filename)
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        file.save(file_path)
    flash('Nạp test thành công!', 'success')
    return redirect(url_for('index'))

def run_tests(file_path, assignment):
    file_extension = os.path.splitext(file_path)[1]
    if file_extension == '.cpp':
        return run_cpp_tests(file_path, assignment)
    else:
        return "Loại tệp không được hỗ trợ", 0

def run_cpp_tests(file_path, assignment):
    test_dir = os.path.join(app.config['TEST_FOLDER'], assignment)
    test_cases = [d for d in os.listdir(test_dir) if os.path.isdir(os.path.join(test_dir, d))]
    total_tests = len(test_cases)
    passed_tests = 0
    fail_messages = []

    executable_path = file_path.replace('.cpp', '')

    try:
        compile_result = subprocess.run(['g++', file_path, '-o', executable_path], capture_output=True, text=True)
        if compile_result.returncode != 0:
            return f"Biên dịch thất bại: {compile_result.stderr}", 0

        for test_case in sorted(test_cases):
            input_file = os.path.join(test_dir, test_case, f'{assignment}.inp')
            output_file = os.path.join(test_dir, test_case, f'{assignment}.out')

            if not os.path.exists(input_file) or not os.path.exists(output_file):
                fail_messages.append(f"Tệp không tồn tại: {input_file} hoặc {output_file}")
                continue

            result = subprocess.run([executable_path], text=True, capture_output=True, input=open(input_file, 'r').read())
            actual_output = result.stdout.strip()

            with open(output_file, 'r') as outp:
                expected_output = outp.read().strip()

            if actual_output == expected_output:
                passed_tests += 1
            else:
                fail_messages.append(f"Sai ở {test_case}: dự kiến {expected_output}, nhưng nhận được {actual_output}")

    except Exception as e:
        return str(e), 0
    finally:
        if os.path.exists(executable_path):
            os.remove(executable_path)

    score = (passed_tests / total_tests) * 100
    if passed_tests == total_tests:
        return "Thành công", 100
    else:
        fail_summary = "<br>".join(fail_messages)
        return f"{fail_summary}<br>Điểm: {score}", score

if __name__ == "__main__":
    if not os.path.exists('uploads'):
        os.makedirs('uploads')
    if not os.path.exists('test'):
        os.makedirs('test')
    app.run(debug=True)
