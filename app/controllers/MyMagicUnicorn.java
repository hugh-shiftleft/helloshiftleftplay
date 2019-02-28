package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.util.HashMap;

public class MyMagicUnicorn extends ObjectInputStream {
    private ClassLoader callerClassLoader;
    private static final HashMap<String, Class<?>> PRIMITIVE_CLASSES = new HashMap<String, Class<?>>();
    static {
        PRIMITIVE_CLASSES.put("boolean", boolean.class);
        PRIMITIVE_CLASSES.put("byte", byte.class);
        PRIMITIVE_CLASSES.put("char", char.class);
        PRIMITIVE_CLASSES.put("double", double.class);
        PRIMITIVE_CLASSES.put("float", float.class);
        PRIMITIVE_CLASSES.put("int", int.class);
        PRIMITIVE_CLASSES.put("long", long.class);
        PRIMITIVE_CLASSES.put("short", short.class);
        PRIMITIVE_CLASSES.put("void", void.class);
    }
    public MyMagicUnicorn(InputStream inputStream) throws IOException {
        super(inputStream);
    }

    protected MyMagicUnicorn() throws IOException, SecurityException {
    }

    @Override
    protected Class<?> resolveClass(ObjectStreamClass desc) throws IOException,
            ClassNotFoundException {
        System.out.println("MAGIC UNICORNNNNNNNN!!!!");
        System.out.println(desc.getName());
        String name = desc.getName();
        try {
            return Class.forName(name, true, this.getClass().getClassLoader());
        } catch (ClassNotFoundException ex) {
            Class cl = (Class) PRIMITIVE_CLASSES.get(name);
            if (cl != null) {
                return cl;
            } else {
                throw ex;
            }
        }
        //return super.resolveClass(desc);
    }
}
