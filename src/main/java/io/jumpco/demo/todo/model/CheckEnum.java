package io.jumpco.demo.todo.model;

public enum CheckEnum

    {
                Task("Task"),
                Bug("Bug"),
                Enhancement("Enhancement"),
                Maintenance("Maintenance"),
                Feature("Feature");

        private String options;

       CheckEnum(String options)
        {
            this.options = options;
        }

        public String getOptions()
        {
            return options;
        }

    }

