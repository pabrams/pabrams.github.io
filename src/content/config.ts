
import { defineCollection, z } from 'astro:content';

const projectsCollection = defineCollection({
  schema: z.object({
    title: z.string(),
    tech: z.array(z.string()),
    category: z.enum(['software-development', 'devops', 'personal-projects']),
    image: z.string().optional(),
    url: z.string().optional(),
    order: z.number().default(99),
  }),
});

export const collections = {
  'projects': projectsCollection,
};
