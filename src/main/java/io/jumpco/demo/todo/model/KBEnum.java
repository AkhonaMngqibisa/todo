package io.jumpco.demo.todo.model;

public enum KBEnum
{

    Ready("Ready"),
    InProgress("InProgress"),
    Done("Done");


    private String kanB;

    KBEnum(String kanB)
    {
        this.kanB = kanB;
    }

    public String getKanB()
    {
        return kanB;
    }

}
