package com.chabak.services;

import com.chabak.repositories.MessageDao;
import com.chabak.vo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class MessageService {
    @Autowired
    MessageDao messageDao;

    public List<Message> selectMessageList(Map map){
        List<Message> messageList = messageDao.selectMessageList(map);
        return messageList;
    }

    public Message selectMessageDetail(int messageNo){
        Message message = messageDao.selectMessageDetail(messageNo);
        return message;
    }

    public int insertMessage(Message message){
        int insertCount = messageDao.insertMessage(message);
        return insertCount;
    }

    public int deleteMessage(int messageNo){
        int deleteCount = messageDao.deleteMessage(messageNo);
        return deleteCount;
    }
}
