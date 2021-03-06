package ceylon.language;

import com.redhat.ceylon.compiler.java.metadata.Ceylon;
import com.redhat.ceylon.compiler.java.metadata.Class;
import com.redhat.ceylon.compiler.java.metadata.Defaulted;
import com.redhat.ceylon.compiler.java.metadata.Ignore;
import com.redhat.ceylon.compiler.java.metadata.Name;
import com.redhat.ceylon.compiler.java.metadata.TypeInfo;
import com.redhat.ceylon.compiler.java.runtime.model.ReifiedType;
import com.redhat.ceylon.compiler.java.runtime.model.TypeDescriptor;

@Ceylon(major = 6)
@Class(extendsType = "ceylon.language::Basic")
public class Exception extends RuntimeException implements ReifiedType {

    @Ignore
    public final static TypeDescriptor $TypeDescriptor$ = TypeDescriptor.klass(Exception.class);

	private static final long serialVersionUID = -1790691559137471641L;

	private String description;
    
    public Exception(
            @TypeInfo("ceylon.language::String|ceylon.language::Null")
            @Name("description")
            @Defaulted
            String description,
            @TypeInfo("ceylon.language::Exception|ceylon.language::Null")
            @Name("cause")
            @Defaulted
            Throwable cause) {
        super(description==null ? null : description.toString(), cause);
        this.description = description;
    }
    
    @Ignore
    public Exception(String description) {
        this(description, $default$cause(description));
    }
    
    @Ignore
    public Exception() {
        this($default$description());
    }
        
    @TypeInfo("ceylon.language::Exception|ceylon.language::Null")
    public Throwable getCause() {
        return super.getCause();
    }
    
    @TypeInfo("ceylon.language::String")
    public java.lang.String getMessage() {
        if (description != null
                && description != null) {
            return description.toString();
        } 
        else if (getCause() != null 
                && getCause().getMessage() != null) {
            return getCause().getMessage();
        }
        return "";
    }

    @TypeInfo("ceylon.language::String")
    public java.lang.String toString() {
        return className_.className(this) + " \"" + getMessage() +"\""; 
    }
    
    @Override
    public void printStackTrace() {
    	super.printStackTrace();
    }

    @Ignore
    public static String $default$description(){
        return null;
    }
    @Ignore
    public static Throwable $default$cause(String description){
        return null;
    }

    @Override
    @Ignore
    public TypeDescriptor $getType$() {
        return $TypeDescriptor$;
    }
}
