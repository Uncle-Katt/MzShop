package com.example.banson5s.ultiltes;

import org.springframework.data.jpa.domain.Specification;

public class EntitySpecifications {
    public static <E> Specification<E> isNotDeleted() {
        return (root, query, builder) -> builder.isFalse(root.get("xoaMem"));
    }

    public static <E> Specification<E> sortByCreatedDate() {
        return (root, query, builder) -> {
            query.orderBy(builder.desc(root.get("ngayTao")));
            return null;
        };
    }

    public static <E> Specification<E> isNotDeletedAndSortByCreatedDate() {
        return Specification.<E>where(isNotDeleted()).and(sortByCreatedDate());
    }
}
