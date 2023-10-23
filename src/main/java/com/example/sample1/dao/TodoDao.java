package com.example.sample1.dao;

import com.example.sample1.domain.Todo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.List;
@Mapper
public interface TodoDao {

    @Select("""
            SELECT T.id, T.todo, T.inserted, COUNT(F.todoId) numOfFiles
            FROM todo T LEFT JOIN todoFile F
                ON T.id = F.todoId
            GROUP BY T.id
            ORDER BY T.id DESC
            """)

    public List<Todo> list();

    @Insert("""
            INSERT INTO todo (todo)
            VALUE (#{todo})   
            """)

    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int insert(Todo todo);

    @Insert("""
            INSERT INTO todoFile (todoId, name)
            VALUES (#{todo.id}, #{fileName})
            """)
    int insertFile(Todo todo, String fileName);

    @Select("""
            SELECT name
            FROM todoFile
            WHERE todoId = #{todoId}
            """)
    List<String> selectFilesByTodoId(Integer todoId);
}
