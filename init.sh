# สร้างโปรเจกต์ Laravel ใหม่
composer create-project --prefer-dist laravel/laravel student-management

# เข้าสู่โฟลเดอร์โปรเจกต์
cd student-management

# สร้างคีย์แอพใหม่
php artisan key:generate

# อัปเดตไฟล์ .env
cat <<EOL > .env
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:4qvm84hgDpMkokJLF+TMyWD+cOXrV6XLJ/d60Wv4N+8=
APP_DEBUG=true
APP_TIMEZONE=UTC
APP_URL=http://localhost

APP_LOCALE=en
APP_FALLBACK_LOCALE=en
APP_FAKER_LOCALE=en_US

APP_MAINTENANCE_DRIVER=file

BCRYPT_ROUNDS=12

LOG_CHANNEL=stack
LOG_STACK=single
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=test
DB_USERNAME=root
DB_PASSWORD=

SESSION_DRIVER=database
SESSION_LIFETIME=120
SESSION_ENCRYPT=false
SESSION_PATH=/
SESSION_DOMAIN=null

BROADCAST_CONNECTION=log
FILESYSTEM_DISK=local
QUEUE_CONNECTION=database

CACHE_STORE=database
CACHE_PREFIX=

MEMCACHED_HOST=127.0.0.1

REDIS_CLIENT=phpredis
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=log
MAIL_HOST=127.0.0.1
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

VITE_APP_NAME="${APP_NAME}"
EOL

# สร้าง migration และ model สำหรับตารางนักศึกษา
php artisan make:model Student -m

# แก้ไข migration เพื่อเพิ่มฟิลด์ที่ต้องการ
cat <<EOL >> database/migrations/*_create_students_table.php
    Schema::create('students', function (Blueprint \$table) {
        \$table->id();
        \$table->string('first_name');
        \$table->string('last_name');
        \$table->timestamps();
    });
EOL

# รัน migration
php artisan migrate

# สร้าง controller สำหรับการจัดการนักศึกษา
php artisan make:controller StudentController --resource

# สร้าง views สำหรับการจัดการนักศึกษา
mkdir -p resources/views/students
cat <<EOL > resources/views/students/index.blade.php
@extends('layouts.app')

@section('content')
<h1>Student Management</h1>
<table>
    <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        @foreach(\$students as \$student)
        <tr>
            <td>{{ \$student->first_name }}</td>
            <td>{{ \$student->last_name }}</td>
            <td>
                <a href="{{ route('students.edit', \$student->id) }}">Edit</a>
                <form action="{{ route('students.destroy', \$student->id) }}" method="POST" style="display:inline;">
                    @csrf
                    @method('DELETE')
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
<a href="{{ route('students.create') }}">Add Student</a>
@endsection
EOL

cat <<EOL > resources/views/students/create.blade.php
@extends('layouts.app')

@section('content')
<h1>Add Student</h1>
<form action="{{ route('students.store') }}" method="POST">
    @csrf
    <label for="first_name">First Name:</label>
    <input type="text" id="first_name" name="first_name" required>
    <label for="last_name">Last Name:</label>
    <input type="text" id="last_name" name="last_name" required>
    <button type="submit">Save</button>
</form>
@endsection
EOL

cat <<EOL > resources/views/students/edit.blade.php
@extends('layouts.app')

@section('content')
<h1>Edit Student</h1>
<form action="{{ route('students.update', \$student->id) }}" method="POST">
    @csrf
    @method('PUT')
    <label for="first_name">First Name:</label>
    <input type="text" id="first_name" name="first_name" value="{{ \$student->first_name }}" required>
    <label for="last_name">Last Name:</label>
    <input type="text" id="last_name" name="last_name" value="{{ \$student->last_name }}" required>
    <button type="submit">Update</button>
</form>
@endsection
EOL

# แก้ไข web.php เพื่อเพิ่ม routes สำหรับ StudentController
cat <<EOL >> routes/web.php
use App\Http\Controllers\StudentController;

Route::resource('students', StudentController::class);
EOL

# สร้างไฟล์ layout app.blade.php
mkdir -p resources/views/layouts
cat <<EOL > resources/views/layouts/app.blade.php
<!DOCTYPE html>
<html>
<head>
    <title>@yield('title', 'Laravel')</title>
</head>
<body>
    @yield('content')
</body>
</html>
EOL

# รันเซิร์ฟเวอร์ Laravel
php artisan serve
