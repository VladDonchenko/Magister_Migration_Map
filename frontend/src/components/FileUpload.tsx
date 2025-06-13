// @ts-nocheck
import React from 'react';
import { Upload, Button, message } from 'antd';
import { UploadOutlined } from '@ant-design/icons';
import { RcFile } from 'antd/lib/upload';
import axios from 'axios';

const FileUpload: React.FC = () => {
  const beforeUpload = (file: RcFile) => {
    const isExcel = file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' || 
                    file.type === 'application/vnd.ms-excel';
    if (!isExcel) {
      message.error('Вы можете загрузить только файл Excel!');
    }
    return isExcel;
  };

  const customRequest = async (options: any) => {
    const { file, onSuccess, onError } = options;
    const formData = new FormData();
    formData.append('file', file);

    try {
      const response = await axios.post('http://localhost:8000/upload', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      });
      message.success('Файл успешно загружен!');
      onSuccess(response, file);
    } catch (error) {
      message.error('Ошибка при загрузке файла.');
      onError(error);
    }
  };

  return (
    <div style={{ margin: '20px' }}>
      <Upload
        accept=".xlsx,.xls"
        beforeUpload={beforeUpload}
        customRequest={customRequest}
        showUploadList={false}
        multiple={false}
      >
        <Button icon={<UploadOutlined />}>
          Загрузить Excel файл
        </Button>
      </Upload>
      <div style={{ marginTop: '10px', fontSize: '12px', color: '#666' }}>
        Поддерживаемые форматы: .xlsx, .xls
      </div>
    </div>
  );
};

export default FileUpload;
