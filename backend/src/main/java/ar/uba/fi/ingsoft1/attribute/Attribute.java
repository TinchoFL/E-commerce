package ar.uba.fi.ingsoft1.attribute;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "attribute", uniqueConstraints = @UniqueConstraint(columnNames = {"attributeName", "attrValue"}))
public class Attribute {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    private String attributeName;

    @Column(name = "attrValue")
    private String value;

    public Attribute(String attributeName, String value){
        this.attributeName = attributeName;
        this.value = value;
    }

}
